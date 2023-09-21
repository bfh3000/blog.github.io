---
title: Visual Studio Custom Setting
published: true
sidebar: post_sidebar
folder: visual_studio
tags: [ blog ]
---

# Visual Studio Custom Settings

## 1. 일반 설정

### 1-1. Text Editor 폰트 설정

### 1-2. Font
- `JetBrainsMono-Regular.ttf` : 가장 기본값  
- `JetBrainsMono-Bold.ttf` : 기본 굵은체

## 2. 키 세팅

### 2-1. 탭 전환
- `Ctrl` + `PgUp/PgDown` : Window.PreviousTab
- `Scope` : Editor
이 키가 작동되도록 하기 위해서는 충돌 나는 키와 트레이드오프 해야합니다.

### 2-2. 탭 닫기
`Ctrl` + `W`: Window.CloseDocumentWindow
이 키가 작동되도록 하기 위해서는 충돌 나는 키와 트레이드 오프 해야합니다.

### 2-3. 라인 제거
`Ctrl`+`D`: Edit.LineDelete
이 키의 기본값은 라인 복제인데, 이 역시 트레이드 오프 해야됩니다.

### 2-4. go to all(similar to "search everywhere")
저는 `Ctrl`+`Shift`+`L`:Edit.GoToAll로 변경합니다. 기본값은 아무것도 지정되어 있지 않습니다. 자바 개발 때에는 IntellJ에서 `Shift x2`이었지만 Visual Studio에서는 기본적으로 `Shift`는 조합해서만 사용가능하기 때문에 이렇게 바꾸었습니다.
이 창에서 나타는 탭이 2개가 있는데, 키보드로 전환은 `Ctrl`+`Tab`으로 전환하면 됩니다.