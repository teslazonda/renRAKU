import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    time_24hr: true
  });
}

export { initFlatpickr };
