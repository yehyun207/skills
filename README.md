# Code Refactoring

기존 movie_repository에서 각 메서드마다 URL 생성, header 설정, http 요청, json 파싱을 각각 수정한 것을 _fetchData 메서드로 추출하여 중복된 코드를 제거 및 간소화하였습니다.<br>
또한 _fetchData내에 JSON 배열을 처리할 때, for루프 대신 map()함수를 사용하여 간결하게 List 객체로 변환하였습니다.
