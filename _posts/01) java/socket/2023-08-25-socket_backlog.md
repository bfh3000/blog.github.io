---
title: socket_backlog
sidebar: post_sidebar
---

# ServerSocket Backlog

## Backlog가 카운팅되고 해소되는 지점을 알 수 있나?
주로 Java 런타임과 운영 체제의 네트워크 스택의 내부 동작과 관련이 있으며, 이는 Java 코드만을 통해서는 직접적으로 접근하기 어려운 내용입니다. Java의 `ServerSocket` 클래스는 하위 수준의 네트워킹 작업을 추상화하므로 백로그가 언제 계산되고 해결되는 정확한 지점이 Java 코드로 세밀하게 노출되지 않을 수 있습니다.

1. **Backlog Increase**: `ServerSocket`을 생성하고 특정 포트에서 수신 대기를 시작할 때 운영 체제의 네트워크 스택은 들어오는 연결 요청을 수락하고 이를 큐에 넣습니다. 백로그 계산이 Java 코드에서 정확히 발생하는 시점은 `ServerSocket` 생성자를 호출하고 백로그 매개변수를 제공할 때입니다.

    ```java
    int port = 8080;
    int backlog = 10;
    ServerSocket serverSocket = new ServerSocket(port, backlog);
    ```

2. **Backlog Decrease**: 백로그는 코드에서 `ServerSocket` 개체의 `accept()` 메서드를 명시적으로 호출할 때 해결됩니다. 이 메서드는 큐에서 연결을 사용 가능할 때까지 차단됩니다. `accept()`를 호출하면 운영 체제는 큐에서 연결 요청을 제거하고 클라이언트와 연결을 설정합니다. 이 시점에서 수락된 연결은 더 이상 백로그의 일부가 아닙니다.

    ```java
    Socket clientSocket = serverSocket.accept();
    ```

실제 네트워킹 작업, 큐 관리 등은 운영 체제의 네트워크 스택에서 처리됩니다. Java는 이러한 작업 위에 추상화를 제공하며, 정확한 타이밍과 동작은 운영 체제, 네트워크 조건 및 시스템 부하와 같은 요소에 따라 다를 수 있습니다.

더 깊이 파고들어 하위 수준 네트워킹 동작을 이해하려면 시스템 수준 설명서를 살펴보거나 운영 체제별 세부 정보도 살펴볼 필요가 있을 수 있습니다.