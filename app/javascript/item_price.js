window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString(addTaxDom)
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString(addProfit)
})})

