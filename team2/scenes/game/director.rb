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
      flags_set
    end

    # 1フレーム描画
    def play
      # タイトル、レベル、スコア表示
      title_draw
      level_draw
      score_draw

      # 秒数カウント
      @enemy_flag += 1

      # 敵の追加と速度上昇
      if @enemy_flag == @enemy_flag_max
        x1 = Wall.add_s
        x2 = Enemy.add(x1)
        Wall.add_a(x2)
        @enemy_flag = 0
        @count += 1
      end

      # 7回毎に敵のスピードアップ
      if @count == 7
        @count = 0
        @enemy_flag_max -= 10
        @speed += 1
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

    def flags_set
      @enemy_flag = 0
      @enemy_flag_max = 120
      @count = 0
      @speed = 1
    end

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end

    def level_draw
      Window.draw_font(400, 5, "Level: " + @speed.to_s, @font)
    end

    # スコアの描画
    def score_draw
      Window.draw_font(550, 5, "Score: " + Score.point.to_s, @font)
    end
  end
end
