document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("post-form");
  if (form) {
    form.reset();
  }
  document.querySelectorAll(".dropdown-toggle").forEach((button) => {
    button.addEventListener("click", function (event) {
      event.stopPropagation(); // Prevent closing immediately
      let dropdownMenu = this.nextElementSibling;
      dropdownMenu.classList.toggle("hidden");
    });
  });

  // Close the dropdown when clicking outside
  document.addEventListener("click", function () {
    document.querySelectorAll(".dropdown-menu").forEach((menu) => {
      menu.classList.add("hidden");
    });
  });

  //modal & forms
  const modalContainers = document.getElementsByClassName("modal-container");
  Array.from(modalContainers).forEach((modalContainer) => {
    const openModalBtn = modalContainer.querySelector(".open-modal-btn");
    const closeModalBtn = modalContainer.querySelector(".close-modal-btn");
    const modal = modalContainer.querySelector(".modal");

    if (modal && openModalBtn) {
      openModalBtn.addEventListener("click", () => {
        modal.classList.remove("hidden");
      });
    }
    if (modal && closeModalBtn) {
      closeModalBtn.addEventListener("click", () => {
        modal.classList.add("hidden");
      });
    }
  });

  //selection & dropboxes
  const mentorSpecialtyDropdowns = document.getElementsByClassName(
    "mentor-specialty-dropdowns"
  );
  const updateMentorSpecialtyDropdown = (specialtySelect, mentorSelect) => {
    const selectedMentor = mentorSelect.value;
    const selectedSpecialty = specialtySelect.value;
    const urlParams = new URLSearchParams(window.location.search); // Returns the value of the query param
    if (selectedMentor) {
      fetch(`/specialties?mentor_name=${encodeURIComponent(selectedMentor)}`)
        .then((response) => response.json())
        .then((data) => {
          specialtySelect.innerHTML =
            mentorSelect.options[0].innerText.includes("All mentor")
              ? `<option value="">All specialties</option>`
              : `<option value="">Select a specialty</option>`;
          data.forEach((specialty) => {
            let option = document.createElement("option");
            option.value = specialty.name;
            if (
              selectedSpecialty == specialty.name ||
              (option.value == urlParams.get("specialty") &&
                mentorSelect.options[0].innerText.includes("All mentor"))
            )
              option.selected = true;
            option.textContent = specialty.name;
            specialtySelect.appendChild(option);
          });
        });
    } else {
      specialtySelect.innerHTML = mentorSelect.options[0].innerText.includes(
        "All mentor"
      )
        ? `<option value="">All specialties</option>`
        : `<option value="">Select a specialty</option>`;
    }
  };
  Array.from(mentorSpecialtyDropdowns).forEach((dropdown) => {
    const mentorSelect = dropdown.querySelector(".mentor-select");
    const specialtySelect = dropdown.querySelector(".specialty-select");

    if (mentorSelect && specialtySelect) {
      mentorSelect.addEventListener("change", function () {
        if (mentorSelect.options[0].innerText.includes("All mentor types")) {
          const form = dropdown.closest("form");
          form.submit();
        }
        updateMentorSpecialtyDropdown(specialtySelect, mentorSelect);
      });
      if (mentorSelect.value) {
        updateMentorSpecialtyDropdown(specialtySelect, mentorSelect);
      }
    }
  });
});
