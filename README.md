# CAD空き台検索
- 自社内でCADを使用する際はCAD専用台を使用している。
- 固定台・リモート専用台がある。
- 各部署に優先台が設定されている。
- しかし、自部署の優先台を使用せず、他部署の優先台を使用する人、
- 固定台をリモートで使用する人が多いため、トラブルが多発している。
- 使用中であれば台番号の色が変わる程度の空き台検索ページはあるが、
- 自部署の優先台はエクセルで展開され連携が取れていないため、
- エクセルと検索ページを交互に見る必要があり、煩わしいため、本ページで完結できるよう統一する

# Free_PC_Search_DataBase_plan

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|post_id|integer|null: false|

### Association
- belongs_to: department, dependent: :destroy
- has_many: pcs

## departmentsテーブル
### Association

## pcsテーブル
### Association

