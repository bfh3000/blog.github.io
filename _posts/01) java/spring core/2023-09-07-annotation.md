---
title: annotation
sidebar: post_sidebar
---

# Spring Annotaion

## 1) `@Component`, `@Service` 비교.

`@Component`와 `@Service`는 Spring Framework에서 클래스를 빈(Bean)으로 등록하기 위해 사용되는 두 가지 주요 애너테이션입니다. 이 두 애너테이션의 주요 차이점은 명시적인 역할과 용도에 있습니다.

1. `@Component` 애너테이션:
   - `@Component`는 Spring Framework에서 컴포넌트 스캔(Component Scan)을 통해 자동으로 빈으로 등록되는 클래스에 부여됩니다.
   - `@Component` 애너테이션은 주로 일반적인 빈으로 사용되며, 특별한 역할을 가진 빈을 나타내지 않습니다.
   - 따라서 클래스를 `@Component`로 표시하면 Spring 컨테이너에서 해당 클래스를 빈으로 인식하고 관리합니다.

```java
@Component
public class MyComponent {
    // ...
}
```

2. `@Service` 애너테이션:
   - `@Service`는 `@Component`의 특수화된 형태로, 비즈니스 서비스 계층의 클래스를 나타내는 데 사용됩니다.
   - `@Service`는 주로 서비스 계층(Service Layer)에서 비즈니스 로직을 수행하는 클래스에 부여됩니다.
   - `@Service` 애너테이션을 사용하면 코드를 더 의미론적으로 읽을 수 있으며, 다른 개발자에게 클래스의 역할을 더 명확하게 전달할 수 있습니다.

```java
@Service
public class MyService {
    // 비즈니스 로직 수행
}
```

따라서 `@Service` 애너테이션은 `@Component`의 특수한 경우로, 비즈니스 로직을 처리하는 클래스에 더 적합하며, 코드의 가독성과 유지 보수성을 향상시킬 수 있습니다. 그러나 기본적으로 Spring은 `@Component` 또는 `@Service`를 모두 빈으로 인식하므로, 선택은 프로젝트의 관례와 개발자의 기호에 따라 결정됩니다.