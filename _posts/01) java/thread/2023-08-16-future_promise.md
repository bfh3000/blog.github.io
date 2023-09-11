---
title: future_promise
sidebar: post_sidebar
---

# Fattern : futrue, promise

Java에서 Future 패턴과 프로미스(Promise) 패턴은 비동기 작업의 결과를 처리하는 데 자주 사용되는 패턴 중 하나입니다.

**Future 패턴**:

Future 패턴은 비동기 작업의 결과를 나중에 가져올 수 있는 방법을 제공합니다. Java에서는 `java.util.concurrent.Future` 인터페이스를 사용하여 이를 구현합니다.

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class FutureExample {
    public static void main(String[] args) throws Exception {
        ExecutorService executorService = Executors.newSingleThreadExecutor();

        // 비동기 작업을 실행하고 Future를 반환합니다.
        Future<String> future = executorService.submit(() -> {
            Thread.sleep(2000);
            return "비동기 작업 완료";
        });

        // 다른 작업 수행 가능
        System.out.println("다른 작업 시작");

        // 비동기 작업 결과를 가져옵니다. 결과가 준비될 때까지 블로킹됩니다.
        String result = future.get();

        System.out.println("비동기 작업 결과: " + result);

        executorService.shutdown();
    }
}
```

**프로미스(Promise) 패턴**:

프로미스 패턴은 비동기 작업의 결과를 처리하는데 사용되며, Java에서는 외부 라이브러리를 사용하여 구현해야 합니다. 대표적인 라이브러리 중 하나는 `CompletableFuture`입니다.

```java
import java.util.concurrent.CompletableFuture;

public class PromiseExample {
    public static void main(String[] args) {
        // CompletableFuture를 사용하여 비동기 작업 실행 및 결과 처리
        CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "비동기 작업 완료";
        });

        // 다른 작업 수행 가능
        System.out.println("다른 작업 시작");

        // 비동기 작업 결과를 처리하는 콜백 함수 등록
        future.thenAccept(result -> {
            System.out.println("비동기 작업 결과: " + result);
        });

        // CompletableFuture는 완료될 때까지 블로킹하지 않음
        // 메인 스레드가 종료되면 비동기 작업이 완료될 때까지 대기
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

위의 코드에서는 `CompletableFuture.supplyAsync` 메서드를 사용하여 비동기 작업을 시작하고, `thenAccept` 메서드를 사용하여 작업이 완료된 후 결과를 처리하는 콜백 함수를 등록합니다.

Future 패턴과 프로미스 패턴은 비동기 작업을 다룰 때 유용하며, 프로미스 패턴은 Java 8부터 `CompletableFuture`를 통해 표준 라이브러리로 제공되므로 자주 사용됩니다.

