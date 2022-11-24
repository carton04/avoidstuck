class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'チャオ御岳スキーリゾート' },
    { id: 2, name: 'ダイナランド' },
    { id: 3, name: '高鷲スノーパーク' },
    { id: 4, name: 'ホワイトピアたかす' },
    { id: 5, name: 'めいほうスキー場' },
    { id: 6, name: 'ウイングヒルズ白鳥リゾート' },
    { id: 7, name: 'ひるがの高原スキー場' },
    { id: 8, name: '鷲ヶ岳スキー場' },
    { id: 9, name: 'スターシュプール緑風リゾート ひだ流葉' },
    { id: 10, name: '飛騨かわいスキー場' }
    { id: 11, name: 'ひだ舟山スノーリゾートアルコピア' }
    { id: 12, name: '平湯温泉スキー場' }
    { id: 13, name: '飛騨ほおのき平スキー場' }
    { id: 14, name: 'モンデウス飛騨位山スノーパーク' }
  ]

  include ActiveHash::Associations
  has_many :congestions
  end