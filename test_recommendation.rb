require 'recommendation'

describe "Test recommendation" do
    it "test sim_distance normal" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 }
        }
        expect(rec.sim_distance(prefs,"馬場","山田").round(7)).to eq(0.1428571)
    end
    it "test sim_distance empty" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "謎解き"=> 4 }, 
            "山田"=> { "相棒"=> 4, }
        }
        expect(rec.sim_distance prefs,"馬場","山田").to eq(0)
    end
    it "test sim_distance same score" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "相棒"=> 4 }, 
            "山田"=> { "相棒"=> 4 }
        }
        expect(rec.sim_distance prefs,"馬場","山田").to eq(1)
    end
    it "test sim_pearson normal" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 }
        }
        expect(rec.sim_pearson(prefs,"馬場","山田").round(7)).to eq(0.8660254)
    end
    it "test sim_pearson empty" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "謎解き"=> 4 }, 
            "山田"=> { "相棒"=> 4, }
        }
        expect(rec.sim_pearson prefs,"馬場","山田").to eq(0)
    end
    it "test sim_pearson same score" do
        rec = Recommendation.new
        prefs = { 
            "馬場"=> { "相棒"=> 4 }, 
            "山田"=> { "相棒"=> 4 }
        }
        expect(rec.sim_pearson prefs,"馬場","山田").to eq(0)
    end
end
