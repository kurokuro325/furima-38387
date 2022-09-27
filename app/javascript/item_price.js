window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const priceInput2 = document.getElementById("add-tax-price");
console.log(priceInput2);
priceInput2.innerHTML = (Math.floor(inputValue * 0.1));

const priceInput3 = document.getElementById("profit");
console.log(priceInput3);
priceInput3.innerHTML = (Math.floor(inputValue - priceInput2.innerHTML));
})

});