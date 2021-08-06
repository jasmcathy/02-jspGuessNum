<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" errorPage="errorHandler.jsp"%>
<jsp:useBean id="Guess" class="domain.GuessGameLogic" scope="session">
	<%
		Guess.initialize(1, 10);
	%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>moreChance</title>
</head>
<body>
	<%
		String guess = request.getParameter("number");
	int guessNum = Integer.parseInt(guess);
	if (Guess.isCorrectGuess(guessNum)) {
		session.invalidate();
	%><jsp:forward page="bingo.jsp" />
	<%
		} else {
	int remainder = Guess.getRemainder();
	if (remainder > 0) {
	%>
	The number
	<%=guess%>
	is not correct.
	</br> You still have
	<%=remainder%>
	chances.
	</br>
	<%=Guess.getHint()%>
	<br />
	<a href="guess.html">Try again</a>
	<%
		} else {
	session.invalidate();
	%><jsp:forward page="fail.jsp" />
	<%
		}
	}
	%>

</body>
</html>