function price (){
  const path = location.pathname
  const editPath = path.includes("items") && path.includes("edit")
  if(path.includes("items/new") ||  editPath){
    const inputPrice = document.getElementById("item-price");
    const addTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    inputPrice.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
      const tax =  Math.floor(inputValue * 0.1);
      addTax.innerHTML = tax;
      profit.innerHTML = inputValue - tax;
      // Mathオブジェクトのfloor()メソッドは、小数点以下を切り捨てます。
      // 引数には数値を指定します。 文字列を指定すると NaN を返します
      // 正規表現でNaNを回避する
    });
  }
}

window.addEventListener("load",price);

