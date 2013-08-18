class Recommendation
    # ユークリッド空間
    def sim_distance prefs,person1,person2
        si={}
        prefs[person1].each do |k,v|
            if prefs[person2][k]
                si[k] = 1
            end
        end

        return 0 if si.size == 0

        sum_of_squares = si.keys.inject(0) do |max,title|
            max += (prefs[person1][title] - prefs[person2][title]) ** 2
        end
        return (1/(sum_of_squares+1).to_f)
    end

    # ピアソン相関
    def sim_pearson prefs,person1,person2
        si={}
        prefs[person1].each do |k,v|
            if prefs[person2][k]
                si[k] = 1
            end
        end

        n = si.size
        return 0 if n == 0

        # スコアの合計
        sum1 = si.keys.inject(0) { |s,i| s += prefs[person1][i] }
        sum2 = si.keys.inject(0) { |s,i| s += prefs[person2][i] }

        # 各作品スコアの平方の合計
        sum1Sq = si.keys.inject(0) { |s,i| s += prefs[person1][i]**2 }
        sum2Sq = si.keys.inject(0) { |s,i| s += prefs[person2][i]**2 }

        # 作品毎の積
        pSum = si.keys.inject(0) { |s,i| s += prefs[person1][i] * prefs[person2][i] }
        num = pSum - (sum1*sum2/n.to_f)
        den = Math::sqrt((sum1Sq - (sum1**2)/n.to_f)*(sum2Sq - (sum2**2)/n.to_f))
        return 0 if den == 0

        return num/den
    end

    # nameとの類似性スコアと相手の名前を取得する
    #   similaliry 相関値関数の選択 
    #   n          出力数
    def top_matches prefs,name,n=-1,similarity=:sim_pearson
        scores = (prefs.keys - [name]).map { |other|
            [self.send(similarity, prefs, name, other), other] 
        }
        return scores.sort.reverse[0...(n < 0 ? scores.size : n)]
    end

    def get_recommendations prefs,name,n=-1,similarity=:sim_pearson
        totals = {}
        sim_sums = {}
        prefs.each do |other,scores|
            next if other == name

            sim = self.send(similarity, prefs, name, other)

            next if sim <= 0

            scores.each do |item,val|
                # まだ見ていない作品の得点を算出
                if prefs[name][item].nil?
                    totals[item] ||= 0
                    totals[item] += val*sim

                    # 類似度の合計もとる
                    sim_sums[item] ||= 0
                    sim_sums[item] += sim
                end
            end
        end

        # 正規化したリストを作る
        rankings = totals.keys.map { |item| 
            [totals[item].to_f/sim_sums[item], item] }

        return rankings.sort.reverse[0...( n<0 ? rankings.size : n)]
    end
end
