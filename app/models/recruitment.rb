class Recruitment < ApplicationRecord
    has_many :recruitment_tags
    has_many :tags, through: :recruitment_tags
    belongs_to :user
    enum category: { メンバー募集:1,対戦相手募集:2,助っ人募集:3,その他:4
    }

	enum area: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
    }

      def save_recruitments(saverecruitment_tags)
      current_tags = self.tags.pluck(:name) unless self.tags.nil?
      old_tags = current_tags - savepost_tags
      new_tags = savepost_tags - current_tags

        # Destroy old taggings:
        old_tags.each do |old_name|
          self.tags.delete Tag.find_by(name:old_name)
        end

        # Create new taggings:
        new_tags.each do |new_name|
          post_tag = Tag.find_or_create_by(name:new_name)
          self.tags << post_tag
        end
      end
end
