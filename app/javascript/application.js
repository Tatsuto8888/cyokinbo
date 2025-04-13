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

  const postIcon = document.getElementById("postIcon");
  const userPosts = document.getElementById("userPosts");
  const userProfile = document.getElementById("userProfile");

  if (postIcon && userPosts) {
    postIcon.addEventListener("click", function () {
      // プロフィールを非表示にし、投稿履歴を表示
      if (userProfile) {
        userProfile.classList.add("hidden");
      }
      userPosts.classList.remove("hidden");
    });
  }

  // プロフィールアイコンのクリックイベント
  const profileIcon = document.getElementById("profileIcon");

  if (profileIcon && userProfile) {
    profileIcon.addEventListener("click", function () {
      // 投稿履歴を非表示にし、プロフィールを表示
      if (userPosts) {
        userPosts.classList.add("hidden");
      }
      userProfile.classList.remove("hidden");
    });
  }
});