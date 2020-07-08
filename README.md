# CAD空き台検索
## 概要
社内で使用しているCADの空き台を検索します。
使用しようとしている台が自部署の優先台か分かるようにしています。

## 制作背景
### 現状
- 自社内でCADを使用する際はCAD専用台を使用している。
- 固定台（プロパー用・委託用）・リモート専用台（プロパー用・委託用）がある。
- 各部署に優先台が設定されている。

### 問題点
- 自部署の優先台を使用せず、他部署の優先台を使用する人、
  固定台をリモートで使用する人が多いため、トラブルが多発している。
- 使用中であれば台番号の色が変わる空き台検索ページはある。
- 負荷に応じて各部署の優先台は毎月変わり、エクセルで展開されているが、
- エクセルと検索ページを交互に見る必要があり、煩わしい。

### 改善点
- 本ページで自部署優先台とCAD_PCの空き状況が分かるようにする。
- 管理者が優先台割付を変更できるようにする

### DEMO
- 未完成

### 実装予定の内容
- 使用したい台をクリックしたら使用中に変わる(step1)
- 使用したい台をクリックしたらリモート用のアプリが立ち上がり、ログインすると使用中に変わる(step2)
- リモート用のアプリを終了させ、ログアウトしたら空き状態に変わる(step3)
- PC台の上にカーソルを合わせたら、使用者がいる場合、JSで使用者と使用者の部署名が出るようにする
- 管理者限定で台の優先部署を変更できるようにする
- プルダウンで部署を選び、その部署の優先台をハイライトする
- 他部署優先台を使用しようとすると、警告を出した上で使用できる状態にする
- ヘッダーにそのユーザーが使える優先台があるかどうかを知らせる欄を追加する


# Free_PC_Search_DataBase_plan

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|post_id|integer|null: false|
|department|references|null: false, foreign_key: true|

### Association
- belongs_to: department, dependent: :destroy
- has_many: computers

## computersテーブル
|Column|Type|Options|
|------|----|-------|
|pc_number|string|null: false|
|post_id|integer|null: false|
|special_function|integer||
|use_method|integer|null: false|
|department|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: department

## departmentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many: users
- has_many: computers
- has_ancestry