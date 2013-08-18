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

        sum1 = si.keys.inject(0) { |s,i| s += prefs[person1][i] }
        sum2 = si.keys.inject(0) { |s,i| s += prefs[person2][i] }

        sum1Sq = si.keys.inject(0) { |s,i| s += prefs[person1][i]**2 }
        sum2Sq = si.keys.inject(0) { |s,i| s += prefs[person2][i]**2 }

        pSum = si.keys.inject(0) { |s,i| s += prefs[person1][i] * prefs[person2][i] }
        num = pSum - (sum1*sum2/n.to_f)
        den = Math::sqrt((sum1Sq - (sum1**2)/n.to_f)*(sum2Sq - (sum2**2)/n.to_f))
        return 0 if den == 0

        return num/den
    end
end
