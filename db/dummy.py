#!/usr/bin/env python3
import os
import math
import pandas as pd

# ---------------------------------------------------------------------
# Allowed columns for the User model (per your migration)
# ---------------------------------------------------------------------
VALID_COLUMNS = {
    'first_name',
    'last_name',
    'phone_number',
    'email',
    'role',
    'library',
    'image',
    'isAdmin',
    'provider',
    'uid',
}

# Columns that might hold the full name if first/last are missing.
POSSIBLE_FULLNAME_COLUMNS = ['name', 'full_name']

# ---------------------------------------------------------------------
# Helper Functions
# ---------------------------------------------------------------------
def is_nan(val):
    if val is None:
        return True
    return isinstance(val, float) and math.isnan(val)

def ruby_escape_string(val):
    if is_nan(val):
        return ""
    return str(val).replace('"', '\\"')

def remove_title_prefix(name):
    """Remove common title prefixes like 'Dr.', 'Prof.', 'Professor'."""
    if not name:
        return name
    prefixes = {"Dr.", "Dr", "Prof.", "Professor", "Prof"}
    tokens = name.split()
    while tokens and tokens[0] in prefixes:
        tokens.pop(0)
    return " ".join(tokens)

# ---------------------------------------------------------------------
# Generate Ruby seed code for a User.
# This code checks if a user exists (by email) then updates or creates.
# ---------------------------------------------------------------------
def generate_user_seed(attributes):
    # Remove any custom keys (like _profession) before generating the User code.
    user_attrs = {k: v for k, v in attributes.items() if not k.startswith("_")}
    email_val = ruby_escape_string(user_attrs["email"])
    lines = []
    lines.append(f'existing = User.find_by(email: "{email_val}")')
    lines.append("if existing")
    
    update_pairs = []
    for k, v in user_attrs.items():
        if k == "email":
            continue
        if is_nan(v) or v == "":
            continue
        if isinstance(v, bool):
            v_str = 'true' if v else 'false'
            update_pairs.append(f'    {k}: {v_str}')
        elif isinstance(v, (int, float)):
            update_pairs.append(f'    {k}: {v}')
        else:
            update_pairs.append(f'    {k}: "{ruby_escape_string(v)}"')
    
    if update_pairs:
        lines.append("  existing.update!(")
        lines.append(",\n".join(update_pairs))
        lines.append("  )")
    else:
        lines.append("  # No additional attributes to update")
    
    lines.append("else")
    
    create_pairs = []
    for k, v in user_attrs.items():
        if is_nan(v) or v == "":
            continue
        if isinstance(v, bool):
            v_str = 'true' if v else 'false'
            create_pairs.append(f'    {k}: {v_str}')
        elif isinstance(v, (int, float)):
            create_pairs.append(f'    {k}: {v}')
        else:
            create_pairs.append(f'    {k}: "{ruby_escape_string(v)}"')
    
    lines.append("  User.create!(")
    lines.append(",\n".join(create_pairs))
    lines.append("  )")
    lines.append("end\n")
    
    return "\n".join(lines)

def generate_plain_create(attributes):
    """Fallback: simple create! call."""
    lines = ["User.create!("]
    for k, v in attributes.items():
        if is_nan(v) or v == "":
            continue
        if isinstance(v, bool):
            v_str = 'true' if v else 'false'
            lines.append(f'  {k}: {v_str},')
        elif isinstance(v, (int, float)):
            lines.append(f'  {k}: {v},')
        else:
            lines.append(f'  {k}: "{ruby_escape_string(v)}",')
    lines.append(")\n")
    return "\n".join(lines)

# ---------------------------------------------------------------------
# Generate Ruby seed code for Mentor model when a profession is extracted.
# This code finds the User by email and then creates/updates a Mentor record.
# ---------------------------------------------------------------------
def generate_mentor_seed(email, profession):
    lines = []
    email_val = ruby_escape_string(email)
    profession_val = ruby_escape_string(profession)
    lines.append(f'u = User.find_by(email: "{email_val}")')
    lines.append("if u")
    lines.append("  Mentor.find_or_create_by(user: u) do |m|")
    lines.append(f'    m.profession = "{profession_val}"')
    lines.append("  end")
    lines.append("end\n")
    return "\n".join(lines)

# ---------------------------------------------------------------------
# Generate Ruby seed code for Student model.
# For users with the role "student", we create/update an associated Student record.
# ---------------------------------------------------------------------
def generate_student_seed(email):
    lines = []
    email_val = ruby_escape_string(email)
    lines.append(f'u = User.find_by(email: "{email_val}")')
    lines.append("if u")
    lines.append("  Student.find_or_create_by(user: u)")
    lines.append("end\n")
    return "\n".join(lines)

# ---------------------------------------------------------------------
# Parse a row from Excel into attributes for the User model.
# It handles splitting names (and removing titles) and sets roles.
# ---------------------------------------------------------------------
def parse_row_for_user(row):
    row_dict = row.to_dict()
    lowered = {}
    for k, v in row_dict.items():
        if k is not None:
            lowered[k.strip().lower()] = v

    attributes = {}

    # --- Handle first and last name ---
    original_first = lowered.get('first_name')
    original_last  = lowered.get('last_name')
    if is_nan(original_first) and is_nan(original_last):
        for possible in POSSIBLE_FULLNAME_COLUMNS:
            if possible in lowered and not is_nan(lowered[possible]):
                full_name = str(lowered[possible]).strip()
                full_name = remove_title_prefix(full_name)
                parts = full_name.split(' ', 1)
                attributes['first_name'] = parts[0]
                attributes['last_name'] = parts[1] if len(parts) > 1 else ""
                break
    else:
        if not is_nan(original_first):
            attributes['first_name'] = remove_title_prefix(str(original_first).strip())
        if not is_nan(original_last):
            attributes['last_name'] = str(original_last).strip()

    # --- Handle other valid columns ---
    for col in VALID_COLUMNS:
        if col in ['first_name', 'last_name']:
            continue
        if col.lower() in lowered and not is_nan(lowered[col.lower()]):
            attributes[col] = lowered[col.lower()]

    # --- Validate and adjust role ---
    # If a role is provided:
    if "role" in lowered and not is_nan(lowered["role"]):
        raw_role = str(lowered["role"]).strip()
        normalized = raw_role.lower()
        # If the role indicates mentor (contains professor, advisor, or mentor)
        if ("professor" in normalized) or ("advisor" in normalized) or ("mentor" in normalized):
            attributes["role"] = "mentor"
            # Extract profession if additional info is provided
            if normalized != "mentor":
                parts = raw_role.split(',')
                if len(parts) > 1:
                    profession = parts[-1].strip()
                else:
                    profession = raw_role
                attributes["_profession"] = profession
        # Allow admin or alumni to be preserved if explicitly provided.
        elif normalized in {"admin", "alumni"}:
            attributes["role"] = normalized
        else:
            # Otherwise, automatically set to student.
            attributes["role"] = "student"
    else:
        # If no role is provided, default to student.
        attributes["role"] = "student"

    return attributes

# ---------------------------------------------------------------------
# Main function to generate seeds.rb from all .xlsx files in the directory.
# It outputs Ruby code for User creation/updating, and for Mentor/Student records when needed.
# Rows with missing email (which is required) are skipped.
# ---------------------------------------------------------------------
def main():
    xlsx_files = [f for f in os.listdir('.') if f.endswith('.xlsx')]
    if not xlsx_files:
        print("No .xlsx files found in the current directory!")
        return

    seed_lines = []
    for xlsx in xlsx_files:
        try:
            df = pd.read_excel(xlsx)
        except Exception as e:
            print(f"Error reading {xlsx}: {e}")
            continue

        seed_lines.append(f"# -----------------------------------------------------")
        seed_lines.append(f"# Seeding from {xlsx}")
        seed_lines.append(f"# -----------------------------------------------------\n")

        for _, row in df.iterrows():
            user_attrs = parse_row_for_user(row)
            # Skip row if no email is provided (email is required)
            if "email" not in user_attrs or not user_attrs["email"]:
                seed_lines.append(f"# Skipping row because email is missing: {row.to_dict()}\n")
                continue
            seed_code = generate_user_seed(user_attrs)
            seed_lines.append(seed_code)
            # Generate Mentor record if _profession is provided
            if "_profession" in user_attrs and "email" in user_attrs:
                mentor_code = generate_mentor_seed(user_attrs["email"], user_attrs["_profession"])
                seed_lines.append(mentor_code)
            # Generate Student record if role is student
            if user_attrs.get("role") == "student":
                student_code = generate_student_seed(user_attrs["email"])
                seed_lines.append(student_code)
        seed_lines.append("\n\n")

    with open("seeds.rb", "w", encoding="utf-8") as f:
        f.write("\n".join(seed_lines))
    print("seeds.rb has been generated successfully!")

if __name__ == "__main__":
    main()

### add this in the end for comments and questions

'''
##create questions
puts "create random questions"
students = User.where(role: :student)

# Grab all users (including mentors, admin, alumni) for commenting
all_users = User.all

if students.empty?
  puts "No students found. Unable to create random questions."
else
  # Some random topics to make questions more interesting
  topics = [
    "AI",
    "Biology",
    "Philosophy",
    "Quantum Mechanics",
    "Ruby on Rails",
    "Travel",
    "Cooking",
    "Fitness",
    "Music",
    "Space"
  ]

  # Create, for example, 5 random questions
  5.times do
    # Pick a random student to ask the question
    asker = students.sample
    topic = topics.sample

    # Create a new question
    question = Question.create!(
      user: asker,
      question: "What do you think about #{topic}?",
      description: "I'm curious to learn more about #{topic}. Does anyone have insights or experiences to share?"
    )

    # For each question, add between 1 and 3 comments from any user
    rand(1..3).times do
      commenter = all_users.sample
      Comment.create!(
        user: commenter,
        question: question,
        content: "This is a random comment about #{topic} from user ##{commenter.id}."
      )
    end
  end
end
'''