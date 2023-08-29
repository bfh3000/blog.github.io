---
title: jekyll_common_2
published: true
sidebar: post_sidebar
folder: jekyll
---

# jekyll
## 1. _includes vs _layouts

Jekyll은 정적 웹 사이트 생성기로, Markdown 같은 마크업 언어를 사용하여 웹 사이트를 만들고 호스팅하는 데 사용됩니다. `_includes`와 `_layouts`는 Jekyll에서 중요한 역할을 하는 디렉토리입니다. 각각의 내용을 비교하자면 아래와 같습니다.

1. `_includes` 디렉토리:
   `_includes` 디렉토리는 Jekyll에서 재사용 가능한 HTML 덩어리나 코드 조각을 저장하는 곳입니다. 이 코드 조각들은 주로 페이지 레이아웃, 포스트 내용, 사이드바, 푸터 등과 같은 다양한 부분에서 사용될 수 있습니다. `_includes` 디렉토리 내에 있는 파일은 주로 HTML 또는 다른 마크업 언어로 작성됩니다.
2. 

   예를 들어, `_includes/header.html` 파일은 웹 사이트의 상단 네비게이션 바를 정의할 수 있고, `_includes/sidebar.html` 파일은 사이드바 컨텐츠를 정의하는 데 사용될 수 있습니다. 이렇게 작성된 코드 조각들은 레이아웃 파일이나 페이지에
서 `include 파일명.html`와 같이 사용하여 포함시킬 수 있습니다.
  

2. `_layouts` 디렉토리:
   `_layouts` 디렉토리는 Jekyll 사이트의 기본 레이아웃을 정의하는데 사용됩니다. 레이아웃은 페이지의 구조와 디자인을 결정합니다. `_layouts` 디렉토리 내에 있는 파일들은 주로 HTML로 작성되며, 각 파일은 페이지 또는 포스트 유형에 대한 템플릿 역할을 합니다.

   예를 들어, `_layouts/default.html` 파일은 기본적인 페이지 레이아웃을 정의할 수 있고, `_layouts/post.html` 파일은 블로그 포스트 페이지의 레이아웃을 정의하는데 사용될 수 있습니다. 페이지나 포스트의 내용은 레이아웃에 정의된 템플릿에 따라서 구성됩니다. 이렇게 구성된 페이지와 포스트는 실제 웹 사이트에서 렌더링될 때 `_includes` 디렉토리의 코드 조각들과 결합됩니다.  
  

3. 요약하자면, `_includes`는 재사용 가능한 코드 조각을 저장하는 공간이며, `_layouts`는 페이지와 포스트의 기본 레이아웃을 정의하는 템플릿을 저장하는 공간입니다. 이 두 디렉토리를 적절하게 활용하여 Jekyll 사이트의 구조와 디자인을 효과적으로 관리할 수 있습니다.

## 2. "_layouts"에서 정의하는 종류는?

`_layouts` 디렉토리는 Jekyll 사이트의 다양한 페이지 유형에 대한 레이아웃을 정의하는데 사용되며, 이 레이아웃은 해당 페이지의 구조와 디자인을 결정합니다.

1. `default.html`:
   이 레이아웃은 대부분의 페이지에서 사용될 기본 레이아웃을 정의합니다. 사이트의 로고, 메뉴, 푸터 등이 포함될 수 있습니다.

```html
<!DOCTYPE html>
<html>
<head>
  <title>{{ page.title }}</title>
</head>
<body>
  <header>
    <!-- 사이트 로고와 메뉴 등 -->
  </header>
  
  <main>
    {{ content }}
  </main>
  
  <footer>
    <!-- 푸터 내용 -->
  </footer>
</body>
</html>
```

2. `post.html`:
   블로그나 글 게시물의 레이아웃을 정의합니다. 보통 본문 내용과 작성자 정보, 댓글 영역 등이 포함될 수 있습니다.

```html
<!DOCTYPE html>
<html>
<head>
  <title>{{ page.title }}</title>
</head>
<body>
  <article>
    <h1>{{ page.title }}</h1>
    <p>{{ page.date | date_to_string }}</p>
    {{ content }}
  </article>
  
  <section id="comments">
    <!-- 댓글 영역 -->
  </section>
</body>
</html>
```

3. `page.html`:
   일반적인 페이지의 레이아웃을 정의합니다. `post.html`과 비슷하나 댓글 영역이 필요하지 않을 수 있습니다.

```html
<!DOCTYPE html>
<html>
<head>
  <title>{{ page.title }}</title>
</head>
<body>
  <main>
    <h1>{{ page.title }}</h1>
    {{ content }}
  </main>
</body>
</html>
```

4. 사용자 정의 레이아웃:
   위의 예시 외에도 사용자 정의 레이아웃을 만들 수 있습니다. 예를 들어, 특정 카테고리를 갖는 페이지나 특수한 디자인 요구 사항을 가진 페이지에 대한 레이아웃을 만들 수 있습니다.

```html
<!DOCTYPE html>
<html>
<head>
  <title>{{ page.title }}</title>
  <!-- 특별한 스타일 시트 또는 스크립트 추가 -->
</head>
<body>
  <header>
    <!-- 특별한 헤더 내용 -->
  </header>
  
  <main>
    {{ content }}
  </main>
  
  <footer>
    <!-- 특별한 푸터 내용 -->
  </footer>
</body>
</html>
```

레이아웃 파일은 `_layouts` 디렉토리에 저장되며, 이 파일들은 Jekyll의 템플릿 엔진을 통해 실제 페이지나 포스트 내용과 결합되어 최종 HTML 페이지를 생성합니다. Jekyll에서는 페이지나 포스트의 헤더(front matter)에 `layout` 속성을 지정하여 어떤 레이아웃을 사용할지 선택할 수 있습니다. 이렇게 함으로써 각각의 페이지나 포스트는 원하는 레이아웃에 따라서 렌더링됩니다.