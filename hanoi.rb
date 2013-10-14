# ハノイの塔アルゴリズム
class Hanoi

  attr_reader :A,:B,:C
  def initialize(n_disks)
    @n_disks = n_disks       # 円盤の枚数

    # 3本の杭
    @A = (1..@n_disks).to_a
    @B = []
    @C = []
  end

  def solve(n = @n_disks, from = :A, to = :C)
    # 一時領域
    work = ([:A,:B,:C]-[from,to]).first

    # 上からn-1番目までの円盤を from から work にうつす
    solve(n-1,from,work) if n > 1
    # 一番大きい円盤を from から to にうつす
    eval("@#{to}").unshift eval("@#{from}").shift
    # from にある円盤を toにうつす
    solve(n-1,work,to) if n > 1
  end
end
