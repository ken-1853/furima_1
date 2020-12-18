function card() {
  const path = location.pathname
  if(path.includes("items") && path.includes("orders")){
    console.log("payjp.js起動中")
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    // ↑のpayjpはgemが入っていなくても使える
    
    const form = document.getElementById("charge-form")
    form.addEventListener("submit",(e)=>{
      e.preventDefault(); // 送信をされたら、一度通常の送信イベントをキャンセルして、jsの処理へ移ります。
  
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      console.log("フォーム送信時にイベント発火")
      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
        // payJp側で指定したキーじゃないといけない
      };
  
      console.log(card)
  
      Payjp.createToken(card, (status, response) => {
  
        // statusはトークンの作成がうまくなされたかどうかを確認できる、HTTPステータスコードが入る
        // responseはそのレスポンスの内容が含まれ、response.idとすることでトークンの値を取得することができます。
        // status == 200、処理がうまくいった場合のみ、トークンの値を取得する
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
  
          // inputタグを使ってフォームの中にtokenの情報を追加している
          // valueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）を示
          const tokenObj = `<input value=${token} name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }else{
          window.alert('購入処理に失敗しました。\nお手数ですが最初からやり直してください。');
  
        }
  
  
        // フォームに存在するクレジットカードの各情報を削除する。サーバーサイドに情報を送りたくないので。
        document.getElementById("card-number").removeAttribute("name");
        // getElementByIdでそれぞれの入力フォームを指定したのち、name属性を削除（nameはその値を示すプロパティ名）
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        // フォームの情報をサーバーサイドに送信
        document.getElementById("charge-form").submit();
  
      });
    
    });



  }
 
};

window.addEventListener("load",card);