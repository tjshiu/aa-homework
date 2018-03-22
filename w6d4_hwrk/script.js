document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = e => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach(li => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const handleFavoriteSubmit = e => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
    favoriteInput.value = "";

    const newListLi = document.createElement("li");
    newListLi.textContent = favorite;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newListLi);
  };

  const showPhotoForm = e => {
    const photoFormDiv = document.querySelector(".photo-form-container");
    if (photoFormDiv.className === "photo-form-container") {
    }
  };

  // --- your code here!

  // adding new photos

  // --- your code here!
});
