# TCASampleCancellation
TCA Cancellation のサンプルリポジトリ

## ファイルツリー

```
TCASampleCancellation
|--SwiftUI
|  |-- EffectsCancellationView.swift # SwiftUI 製の View と TCA の各要素
|- UIKit
|  |-- EffectsCancellationViewController.swift  # UIKit 製の View
|  |-- EffectsCancellationViewController.xib # xib
|- Internal
|  |-- ActivityIndicator.swift # ローディング中であることを示す Indicator
|  |-- UIViewRepresented.swift # UIKit から ActivityIndicator を利用できるようにしている
|-- TCASampleCancellationApp.swift # Root View
|-- NumbersAPIClient.swift # NumbersAPI と通信するための APIClient 
```

## 参考
Point-Free さんの [CaseStudies](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/CaseStudies) の `02-Effects-Cancellation.swift` を主に参考に作成しています。
