<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/birthday.css">
    <title>運勢占い</title>

    <script>
        // 運勢を決定する関数
        function getHoroscope() {
            const month = document.getElementById("month").value;
            const day = document.getElementById("day").value;

            let horoscope = "";

            // 月日によって運勢を決定
            if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
                horoscope = "♈おひつじ座(牡羊座): 今日はエネルギーに満ち溢れ、前向きに進んでいける日です。新しいプロジェクトや挑戦を始めるのに絶好のタイミング。周りのサポートも得られるので、自信を持って行動しましょう。ただし、焦らず冷静に判断することを心がけて。";
            } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
                horoscope = "♉おうし座(牡牛座): 安定した一日が過ごせそうです。日々の努力が実を結び、金銭面でも少し良い兆しがあります。身の回りの人々との関係を大切にすると、さらに良い結果が得られるでしょう。心地よい環境作りを意識してみて。";
            } else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
                horoscope = "♊ふたご座(双子座): 好奇心旺盛なあなたにとって、今日は情報を集めるのに最適な日です。新しい知識やスキルを学び、今後の活動に役立てましょう。社交的なあなたが輝ける場面も多いので、積極的に人と関わっていくと良い結果が待っています。";
            } else if ((month == 6 && day >=22) || (month == 7 && day <= 22)) {
                horoscope = "♋かに座(蟹座): 今日は感情が豊かになり、家族や親しい人との絆を深めることができそうです。心の安定を大切にし、無理せずリラックスした時間を過ごすことが運気を上げるカギです。過去の出来事に対する整理が進むかもしれません。";
            }　else if ((month == 7 && day >=23) || (month == 8 && day <= 22)) {
                horoscope = "♌しし座(獅子座): 自信が持てる日ですが、少し自己中心的になりがちです。他人との協力を意識することで、運気がさらに上昇します。自己表現の場が増えるので、思い切って自分の意見を伝えてみましょう。周囲の反応が良い結果を生むはずです。";
            } else if ((month == 8 && day >=23) || (month == 9 && day <= 22)) {
                horoscope = "♍おとめ座(乙女座): 今日のあなたは非常に慎重に物事を進めることができ、計画的に動くことで安定感が得られます。細かい作業や整理整頓が得意な日なので、気になることを片付けてすっきりとした気分になれるでしょう。健康にも気を使って。";
            } else if ((month == 9 && day >=23) || (month == 10 && day <= 23)) {
                horoscope = "♎てんびん座(天秤座): 人間関係においてバランスを取ることが求められる日です。周りの人々との調和を大切にし、無理をせずに柔軟に対応すると良い結果を招きます。恋愛面では、気になる相手との関係が進展する可能性も。";
            } else if ((month == 10 && day >=24) || (month == 11 && day <= 22)) {
                horoscope = "♏さそり座(蠍座): 今日は直感が冴えているので、大きな決断をするには良い日です。感情的に動くことが多くなりますが、冷静に状況を見極めることで、良い方向に進むことができるでしょう。人間関係での深い理解が進む時期です。";
            } else if ((month == 11 && day >=23) || (month == 12 && day <= 21)) {
                horoscope = "♐いて座(射手座): 今日は冒険心が湧き、外の世界に目を向けることが良い結果に繋がります。新しい経験をすることで視野が広がり、今後の人生において有益な知識を得ることができるでしょう。ポジティブなエネルギーを周囲にも伝えて。";
            } else if ((month == 12 && day >=22) || (month == 1 && day <= 19)) {
                horoscope = "♑やぎ座(山羊座): 今日のあなたは着実に物事を進めることができ、努力が実を結ぶ日です。計画的に行動すれば、確実に結果が出ます。目標に向かって一歩一歩進んでいくことが成功に繋がります。人からのサポートも期待できるでしょう。";
            } else if ((month == 1 && day >=20) || (month == 2 && day <= 18)) {
                horoscope = "♒みずがめ座(水瓶座): 今日のあなたは創造的で独自のアイディアが湧きやすい日です。革新的な考えを持っているあなたには、新しいプロジェクトを始めるのに最適なタイミングです。ただし、周囲の人々との協力を意識すると、さらに良い結果を得られるでしょう。";
            } else if ((month == 2 && day >=19) || (month == 3 && day <= 20)) {
                horoscope = "♓うお座(魚座):感受性が高く、周囲の影響を受けやすい日です。リラックスできる時間を作ることで、心のバランスを取ることができそうです。直感が冴えているので、迷ったときには自分の心の声に従うと良い結果が待っています。";
            }

            // 結果を表示
            document.getElementById("result").innerHTML = horoscope;


            //<--matuzaki
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "SaveBirthdayFortuneServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("horoscope=" + encodeURIComponent(horoscope));
            //matuzaki-->
        }

    </script>
</head>
<body>
<h2>誕生日占い</h2>

<!-- 生年月日入力フォーム -->
<label for="month">月:</label>
<select id="month">
    <option value="1">1月</option>
    <option value="2">2月</option>
    <option value="3">3月</option>
    <option value="4">4月</option>
    <option value="5">5月</option>
    <option value="6">6月</option>
    <option value="7">7月</option>
    <option value="8">8月</option>
    <option value="9">9月</option>
    <option value="10">10月</option>
    <option value="11">11月</option>
    <option value="12">12月</option>
</select>

<label for="day">日:</label>
<select id="day">
    <option value="1">1日</option>
    <option value="2">2日</option>
    <option value="3">3日</option>
    <option value="4">4日</option>
    <option value="5">5日</option>
    <option value="6">6日</option>
    <option value="7">7日</option>
    <option value="8">8日</option>
    <option value="9">9日</option>
    <option value="10">10日</option>
    <option value="11">11日</option>
    <option value="12">12日</option>
    <option value="13">13日</option>
    <option value="14">14日</option>
    <option value="15">15日</option>
    <option value="16">16日</option>
    <option value="17">17日</option>
    <option value="18">18日</option>
    <option value="19">19日</option>
    <option value="20">20日</option>
    <option value="21">21日</option>
    <option value="22">22日</option>
    <option value="23">23日</option>
    <option value="24">24日</option>
    <option value="25">25日</option>
    <option value="26">26日</option>
    <option value="27">27日</option>
    <option value="28">28日</option>
    <option value="29">29日</option>
    <option value="30">30日</option>
    <option value="31">31日</option>
</select>

<a href="#" class="btn-square-shadow" onclick="getHoroscope()">占う</a>

<!-- 結果表示 -->
<h3>運勢結果:</h3>
<p id="result"></p>

<a href="all-result.jsp">占い結果一覧に戻る</a><!--matuzaki-->
</body>
</html>
