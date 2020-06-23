# CAD空き台検索
## 現状
- 自社内でCADを使用する際はCAD専用台を使用している。
- 固定台（プロパー用・委託用）・リモート専用台（プロパー用・委託用）がある。
- 各部署に優先台が設定されている。

## 問題点
- しかし、自部署の優先台を使用せず、他部署の優先台を使用する人、
- 固定台をリモートで使用する人が多いため、トラブルが多発している。
- 使用中であれば台番号の色が変わる空き台検索ページはあるが。
- 自部署の優先台毎月変わり、エクセルで展開されているが、
- エクセルと検索ページを交互に見る必要があり、煩わしい。

## 改善点
- 本ページで自部署優先台とCAD_PCの空き状況が分かるようにする。
- 管理者が優先台割付を変更できるようにする


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
- has_one: department

## departmentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many: users
- belongs_to: computer