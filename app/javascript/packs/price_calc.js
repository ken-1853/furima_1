function price (){
  // const path = location.pathname
  // const editPath = path.includes("items") && path.includes("edit")
  // if(path.includes("items/new") ||  editPath){
    console.log("price_calc.js起動中")
    const inputPrice = document.getElementById("item-price");
    const addTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    inputPrice.addEventListener("input", () => {
      const itemPrice = inputPrice.value
    
      addTax.innerHTML = Math.floor(itemPrice * 0.1);
      profit.innerHTML = Math.floor(itemPrice * 0.9);
      // Mathオブジェクトのfloor()メソッドは、小数点以下を切り捨てます。
      // 引数には数値を指定します。 文字列を指定すると NaN を返します
      // 正規表現でNaNを回避する
    });
  // }
}

window.addEventListener("load",price);