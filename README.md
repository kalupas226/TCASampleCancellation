# TCASampleCancellation
TCA Cancellation のサンプルリポジトリ

## ファイルツリー

```
TCASampleCancellation
|__SwiftUI
|   |__ EffectsCancellationView.swift # SwiftUI 製の View と TCA の各要素
|__ UIKit
|   |__ EffectsCancellationViewController.swift  # UIKit 製の View
|   |__ EffectsCancellationViewController.xib # xib
|__ Internal
|   |__ ActivityIndicator.swift # ローディング中であることを示す Indicator
|   |__ UIViewRepresented.swift # UIKit から ActivityIndicator を利用できるようにしている
|__ TCASampleCancellationApp.swift # Root View
|__ NumbersAPIClient.swift # NumbersAPI と通信するための APIClient 
```

## 参考
Point-Free さんの [CaseStudies](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/CaseStudies) の `02-Effects-Cancellation.swift` を主に参考に（一部コードも借りつつ）作成しています。
