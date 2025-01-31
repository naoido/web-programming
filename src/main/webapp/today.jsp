<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/today-style.css">
    <title>今日のおみくじ</title>
    
</head>
<body>
<jsp:include page="nav.jsp">
    <jsp:param name="page" value="today" />
</jsp:include>
<h1>今日のおみくじ</h1>

<div>
    <p>今日の日付: <script>
        document.write(new Date().toLocaleDateString());
    </script></p>
</div>


<div class="wrapper">
    <p>ボタンをクリックして今日のおみくじを引こう！</p>
    <div class="wrapper-button">
        <button id="button">あなたの運勢を占う</button>
    </div>
    <p id="result"></p> <!-- 占い結果を表示する場所 -->
    <p id="comment"></p> <!-- コメントを表示する場所 -->
</div>

<script>
    window.onload = function() {
        // ボタンがクリックされたときの処理
        document.getElementById("button").onclick = function() {
            // おみくじの結果リスト
            const list = ["大吉", "吉", "中吉", "小吉", "末吉", "凶", "大凶"];
            // ランダムで結果を選択
            const random = Math.floor(Math.random() * list.length);
            const result = list[random];

            // 結果を画面に表示
            document.getElementById("result").textContent = result;
            showComment(result);  // 結果に応じたコメントを表示

            // 結果と現在の日付をlocalStorageに保存
            const currentDate = new Date().toLocaleDateString();
            localStorage.setItem("omikujiResult", result);
            localStorage.setItem("omikujiDate", currentDate);

            // ボタンを無効にしてメッセージを変更
            document.getElementById("button").disabled = true;
            document.getElementById("button").textContent = "今日のおみくじはもう引けません";
        };
    };

    // 結果に応じたコメントを表示する関数
    function showComment(result) {
        let comment = '';
        switch(result) {
            case "大吉":
                comment = "素晴らしい日が待っています！最高の運勢です！";
                break;
            case "吉":
                comment = "良いことが起こりそうです。前向きにいきましょう！";
                break;
            case "中吉":
                comment = "普通の運勢ですが、無理せず過ごせば良いことがあるかも！";
                break;
            case "小吉":
                comment = "小さな幸運が訪れるかもしれません。気をつけて過ごして！";
                break;
            case "末吉":
                comment = "少し注意が必要かもしれません。慎重に行動を！";
                break;
            case "凶":
                comment = "今日は慎重に行動することをおすすめします。無理をしないで！";
                break;
            case "大凶":
                comment = "今日はちょっと注意が必要です。無理せず過ごしましょう。";
                break;
            default:
                comment = "運勢は不確定です。心を落ち着けて過ごしてください。";
                break;
        }
        // コメントを表示する要素を更新
        document.getElementById("comment").textContent = comment;
    }
</script>
</body>
</html>