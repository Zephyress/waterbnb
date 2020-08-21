import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const flatpickr1 = () => {
  flatpickr(".datepicker", {
    altInput: true
  });
}

export { flatpickr1 };
