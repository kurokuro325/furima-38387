window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
})

const priceInput2 = document.getElementById("add-tax-price");
console.log(priceInput2);

const priceInput3 = document.getElementById("profit");
console.log(priceInput3);

  console.log("OK");

});