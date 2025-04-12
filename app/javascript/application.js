// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "@hotwired/turbo-rails"


document.addEventListener("DOMContentLoaded", () => {
  const likeButtons = document.querySelectorAll(".like-toggle-button");

  likeButtons.forEach(button => {
    button.addEventListener("click", event => {
      event.preventDefault();
      event.stopPropagation(); // ✅ prevent click from bubbling to parent link

      const action = button.getAttribute("formaction");
      const method = button.getAttribute("formmethod").toUpperCase();
      const authToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

      fetch(action, {
        method: method,
        headers: {
          "X-CSRF-Token": authToken,
          "Accept": "application/json"
        }
      })
      .then(response => {
        if (response.ok) {
          console.log("✅ Like/Unlike successful");
          // Optional: update the counter here later
        } else {
          console.error("❌ Request failed:", response.statusText);
        }
      })
      .catch(error => console.error("Error:", error));
    });
  });
});
