window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const priceInput2 = document.getElementById("add-tax-price");
priceInput2.innerHTML = (Math.floor(inputValue * 0.1));

const priceInput3 = document.getElementById("profit");
priceInput3.innerHTML = (Math.floor(inputValue - priceInput2.innerHTML));
})

});