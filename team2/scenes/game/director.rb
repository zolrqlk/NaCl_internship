# ゲームモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director
    DEBUG_MODE = true

    # 初期化
    def initialize
      @font = Font.new(28)
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      Enemy.init
      Wall.init
      Score.init
      Shot.init
      Player.init
      @flag = 0
      @flag_max = 100
    end

    # 1フレーム描画
    def play
      # タイトルとスコア表示
      title_draw
      score_draw

      # 秒数カウント
      @flag += 1

      # 敵の追加と速度上昇
      if @flag == @flag_max
        x1 = Wall.add_s
        x2 = Enemy.add(x1)
        Wall.add_a(x2)
        @flag = 0
        @flag_max -= 1
      end

      # 弾の追加
      if Input.key_push?(K_SPACE)
        Shot.push(Player.x, Player.y - Shot.img.width, Shot.img)
      end

      # 各オブジェクトの移動
      Player.move
      Wall.move
      Enemy.move
      Shot.move

      # enemyとwallがプレイヤーに当たったときの判定(プレイヤーが消える)
      Sprite.check(Enemy.collection,Player.body)
      Sprite.check(Wall.collection,Player.body)

      # 弾がenemy(not)に当たったらどっちも消える
      Sprite.check(Shot.collection,Enemy.collection)

      # 弾がwallに当たったら弾だけ消える
      Sprite.check(Shot.collection,Wall.collection)
    end

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end

    # スコアの描画
    def score_draw
      Window.draw_font(650, 5, Score.point.to_s, @font)
    end
  end
end
