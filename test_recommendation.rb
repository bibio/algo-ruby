require 'recommendation'

describe "Test recommendation" do
    it "test sim_distance normal" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 }
        }
        expect(rec.sim_distance(prefs,"斎藤 ","山田").round(7)).to eq(0.1428571)
    end
    it "test sim_distance empty" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "謎解き"=> 4 }, 
            "山田"=> { "相棒"=> 4, }
        }
        expect(rec.sim_distance prefs,"斎藤 ","山田").to eq(0)
    end
    it "test sim_distance same score" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "相棒"=> 4 }, 
            "山田"=> { "相棒"=> 4 }
        }
        expect(rec.sim_distance prefs,"斎藤 ","山田").to eq(1)
    end
    it "test sim_pearson normal" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 }
        }
        expect(rec.sim_pearson(prefs,"斎藤 ","山田").round(7)).to eq(0.8660254)
    end
    it "test sim_pearson empty" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "謎解き"=> 4 }, 
            "山田"=> { "相棒"=> 4, }
        }
        expect(rec.sim_pearson prefs,"斎藤 ","山田").to eq(0)
    end
    it "test sim_pearson same score" do
        rec = Recommendation.new
        prefs = { 
            "斎藤 "=> { "相棒"=> 4 }, 
            "山田"=> { "相棒"=> 4 }
        }
        expect(rec.sim_pearson prefs,"斎藤 ","山田").to eq(0)
    end
    it "test top_maches normal by sim_pearson" do
        rec = Recommendation.new
        prefs = { 
            "斎藤"=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 },
            "岡田"=> { "謎解き"=> 5, "相棒"=> 2, "真夏の方程式"=> 4 },
            "石川"=> { "謎解き"=> 2, "相棒"=> 4, "真夏の方程式"=> 3 },
            "富田"=> { "男はつらいよ"=> 5, "謎解き"=> 5, "相棒"=>1,"真夏の方程式"=> 1 },
            "大島"=> { "男はつらいよ"=> 2, "謎解き"=> 3, "相棒"=>5,"真夏の方程式"=> 2 },
            "渡辺"=> { "謎解き"=> 4, "相棒"=>3,"真夏の方程式"=> 4,"坂の上から"=>4 }
        }
        expect(rec.top_matches(prefs, "斎藤",1)).to eq([[0.9449111825230686,"大島"]])
    end
    it "test sim_pearson same score" do
        rec = Recommendation.new
        prefs = { 
            "斎藤" => { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田" => { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }
        }
        expect(rec.top_matches(prefs, "斎藤",1)).to eq([[1,"山田"]])
    end
    it "test sim_pearson mismatch score" do
        rec = Recommendation.new
        prefs = { 
            "斎藤" => { "謎解き"=> 4 }, 
            "山田" => { "相棒"=> 5 }
        }
        expect(rec.top_matches(prefs, "斎藤",1)).to eq([[0,"山田"]])
    end
    it "test sim_pearson another score" do
        rec = Recommendation.new
        prefs = { 
            "斎藤" => { "相棒"=> 1 }, 
            "山田" => { "相棒"=> 5 }
        }
        expect(rec.top_matches(prefs, "斎藤",1)).to eq([[0,"山田"]])
    end
    it "test top_maches normal by sim_distance" do
        rec = Recommendation.new
        prefs = { 
            "斎藤"=> { "謎解き"=> 4, "相棒"=> 5, "真夏の方程式"=> 4 }, 
            "山田"=> { "謎解き"=> 3, "相棒"=> 4, "真夏の方程式"=> 2, "坂の上から"=> 5 },
            "岡田"=> { "謎解き"=> 5, "相棒"=> 2, "真夏の方程式"=> 4 },
            "石川"=> { "謎解き"=> 2, "相棒"=> 4, "真夏の方程式"=> 3 },
            "富田"=> { "男はつらいよ"=> 5, "謎解き"=> 5, "相棒"=>1,"真夏の方程式"=> 1 },
            "大島"=> { "男はつらいよ"=> 2, "謎解き"=> 3, "相棒"=>5,"真夏の方程式"=> 2 },
            "渡辺"=> { "謎解き"=> 4, "相棒"=>3,"真夏の方程式"=> 4,"坂の上から"=>4 }
        }
        expect(rec.top_matches(prefs, "斎藤",1,:sim_distance)).to eq([[0.2,"渡辺"]])
    end
end
