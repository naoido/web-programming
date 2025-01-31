<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>タロット占い</title>
    <script>
        function showTarot() {
            document.getElementById("tarotForm").submit();
        }
    </script>
</head>
<body>
<jsp:include page="nav.jsp">
    <jsp:param name="page" value="tarot" />
</jsp:include>
<h1>タロット占い</h1>
<%
    // タロットカードの名前と意味のリスト
    List<Map<String, String>> tarotCards = Arrays.asList(
            Map.of("name", "愚者", "meaning", "新しい始まり、自由、冒険", "fortune", "今日は新しいことに挑戦するのに最適な日です。"),
            Map.of("name", "魔術師", "meaning", "創造力、意志力、行動", "fortune", "今日は自分の力を信じて行動しましょう。"),
            Map.of("name", "女教皇", "meaning", "知識、直感、秘密", "fortune", "今日は直感を信じて行動すると良い結果が得られます。"),
            Map.of("name", "女帝", "meaning", "豊かさ、母性、自然", "fortune", "今日は自然と触れ合い、リラックスするのに良い日です。"),
            Map.of("name", "皇帝", "meaning", "権威、安定、支配", "fortune", "今日は計画を立てて行動すると成功します。"),
            Map.of("name", "法王", "meaning", "伝統、信仰、教育", "fortune", "今日は学びと成長のための良い日です。"),
            Map.of("name", "恋人", "meaning", "愛、調和、選択", "fortune", "今日は大切な人との関係を深めるのに良い日です。"),
            Map.of("name", "戦車", "meaning", "勝利、意志力、決断", "fortune", "今日は目標に向かって突き進むのに良い日です。"),
            Map.of("name", "力", "meaning", "勇気、忍耐、内なる力", "fortune", "今日は自分の内なる力を信じて行動しましょう。"),
            Map.of("name", "隠者", "meaning", "内省、知恵、孤独", "fortune", "今日は一人の時間を大切にし、内省するのに良い日です。"),
            Map.of("name", "運命の輪", "meaning", "変化、運命、周期", "fortune", "今日は運命の変化を受け入れるのに良い日です。"),
            Map.of("name", "正義", "meaning", "公平、真実、責任", "fortune", "今日は公正な判断を下すのに良い日です。"),
            Map.of("name", "吊るされた男", "meaning", "犠牲、逆転、洞察", "fortune", "今日は新しい視点を得るために一歩引いてみましょう。"),
            Map.of("name", "死神", "meaning", "終わり、変容、新しい始まり", "fortune", "今日は古いものを手放し、新しい始まりを迎えるのに良い日です。"),
            Map.of("name", "節制", "meaning", "バランス、調和、節度", "fortune", "今日はバランスを保ち、調和を大切にしましょう。"),
            Map.of("name", "悪魔", "meaning", "誘惑、束縛、物質主義", "fortune", "今日は誘惑に注意し、自分を律するのに良い日です。"),
            Map.of("name", "塔", "meaning", "崩壊、変革、啓示", "fortune", "今日は予期せぬ変化に備えましょう。"),
            Map.of("name", "星", "meaning", "希望、癒し、インスピレーション", "fortune", "今日は希望を持ち、癒しを求めるのに良い日です。"),
            Map.of("name", "月", "meaning", "幻想、直感、不安", "fortune", "今日は直感を信じ、不安を乗り越えるのに良い日です。"),
            Map.of("name", "太陽", "meaning", "成功、喜び、活力", "fortune", "今日は成功と喜びを感じるのに良い日です。"),
            Map.of("name", "審判", "meaning", "再生、評価、覚醒", "fortune", "今日は過去を振り返り、再生の時を迎えるのに良い日です。"),
            Map.of("name", "世界", "meaning", "完成、達成、統合", "fortune", "今日は目標を達成するための良い日です。")
    );

    // ランダムにタロットカードを選択
    Map<String, String> selectedCard = null;
    if (request.getMethod().equalsIgnoreCase("POST")) {
        Random rand = new Random();
        selectedCard = tarotCards.get(rand.nextInt(tarotCards.size()));

        // 選択されたカードをセッションに保存
        session.setAttribute("selectedCard", selectedCard);

        // サーブレットにリダイレクトして結果を保存
        response.sendRedirect("SaveTarotResultServlet");
        return;
    }

    // セッションからタロット占いの結果を取得
    String tarotResult = (String) session.getAttribute("tarotResult");
%>

<form id="tarotForm" method="post">
    <button type="button" onclick="showTarot()">タロットを引く</button>
</form>

<% if (tarotResult != null) { %>
<h2>タロットカードの結果</h2>
<p><%= tarotResult %></p>
<a href="all-result.jsp">占い結果一覧に戻る</a>
<% } %>

</body>
</html>
