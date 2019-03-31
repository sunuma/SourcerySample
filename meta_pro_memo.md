### Swift メタプログラミング

- Sourceryについて
-

#### Sourceryについて

Swiftコードを生成するツール  
https://github.com/krzysztofzablocki/Sourcery

現在、リファクタリングで使用  
・VIPERのPresenter、Interactorのユニットテストで使用  
・Presenter、InteractorのMockを自動生成  

** どうせならUIテストでもテンプレートを自動生成したい **  

今のUIテストのコードはよくないため、今後は[Page Object](https://www.wantedly.com/companies/wantedly/post_articles/155005)を使用してUIテストを作成  
Page ObjectのPageクラスはViewControllerに構成が似ている  
  - ViewControllerのUI関連のプロパティは@IBOutletで定義  
  - UIテスト側ではXCUIElementとしてUIにアクセス  

なら、各ViewControllerをベースにPageクラスを生成し  
ViewControllerの@IBOutletからPageクラスのXCUIElementを生成  

#### Pageクラスの生成

例）`LoginViewController`から`LoginPage`を生成  
LoginViewController
```
class LoginViewController: UIViewController {
    @IBOutlet weak var loginIdTitle: UILabel!
    @IBOutlet weak var passwordTitle: UILabel!
    @IBOutlet weak var loginIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

LoginPage
```
class LoginPage: Page {
    let loginIdTitle: XCUIElement
    let passwordTitle: XCUIElement
    let loginIdField: XCUIElement
    let passwordField: XCUIElement
    let loginButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
    	loginIdTitle = app.staticTexts[""]
    	passwordTitle = app.staticTexts[""]
    	loginIdField = app.textFields[""]
    	passwordField = app.textFields[""]
    	loginButton = app.buttons[""]
    }
}
```
Page.stencil（Pageクラス生成用テンプレート）
```
import Foundation
import XCTest

{% for type in types.classes %}
{% if type.name | contains:"ViewController" %}
class {{ type.name | replace:"ViewController","" }}Page: Page {
    let app: XCUIApplication
    {% for variable in type.variables %}
    {% if variable.typeName.name  == "UILabel!" %}
    private var {{ variable.name }}: XCUIElement { return app.staticTexts["{{ variable.name }}"] }
    {% elif variable.typeName.name  == "UITextField!" %}
    private var {{ variable.name }}: XCUIElement { return app.textFields["{{ variable.name }}"] }
    {% elif variable.typeName.name  == "UIButton!" %}
    private var {{ variable.name }}: XCUIElement { return app.buttons["{{ variable.name }}"] }
    {% endif %}
    {% endfor %}

    init(app: XCUIApplication) {
        self.app = app
    }
}

{% endif %}
{% endfor %}
```
テンプレート書き方参考  
https://qiita.com/bannzai/items/9e6b72d5a61a59b7c6be  
https://cdn.rawgit.com/krzysztofzablocki/Sourcery/master/docs/writing-templates.html  
https://github.com/krzysztofzablocki/Sourcery/blob/master/Templates/Templates/AutoMockable.stencil  

入力、出力、テンプレートのパスをyamlファイルに定義  
.sourcery.yml
```
sources:
  - ./SourcerySample/
templates:
  - ./templates/
output:
  ./SourcerySampleUITests/Page/
```
プロジェクトディレクトリ直下でコード生成コマンドを実行  
今回cocoPodsを使用しているためパスはPodsディレクトリ内
```
./Pods/Sourcery/bin/sourcery
```
