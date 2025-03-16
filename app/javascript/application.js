// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", function() {
  // ハンバーガーメニュー（既存）
  const menu = document.getElementById("menu");
  const button = document.getElementById("hamburger-button");

  if (button && menu) {
      button.addEventListener("click", function() {
          menu.classList.toggle("hidden");
      });
  }

  // 「…」メニューの処理（追加）
  const menuDropdown = document.getElementById("menuDropdown");
  const menuButton = document.getElementById("menuButton");

  if (menuButton && menuDropdown) {
      menuButton.addEventListener("click", function(event) {
          event.stopPropagation();
          menuDropdown.classList.toggle("hidden");
      });

      // メニュー外をクリックしたら閉じる
      document.addEventListener("click", function(event) {
          if (!menuButton.contains(event.target) && !menuDropdown.contains(event.target)) {
              menuDropdown.classList.add("hidden");
          }
      });
  }
});