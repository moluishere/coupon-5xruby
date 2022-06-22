import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["SerialContent"];

  connect() {
    console.log();
  }

  GetContent() {
    const book_id = document.querySelector("#book_id").dataset.book_id;
    const book_price = document.querySelector("#book_price").textContent;
    const serial = this.SerialContentTarget.value;

    const data = new FormData();
    data.append("book_id", book_id);
    data.append("serial", serial);

    Rails.ajax({
      type: "post",
      url: `/books/${book_id}/apply_coupon`,
      data,
      success: () => {
        // document.querySelector(`#${serial}`).style.display = "none";
      },
      error: () => {},
    });
  }
}
