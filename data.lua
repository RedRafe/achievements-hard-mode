local function target(setting_name)
  return settings.startup[setting_name].value
end

local updates = {
  ['build-entity-achievement'] = {
    ['getting-on-track'] = { amount = 1e2 }, --1
    ['getting-on-track-like-a-pro'] = { until_second = 71 * 60 }, --90*60
  },
  ['finish-the-game-achievement'] = {
    ['no-time-for-chitchat'] = { until_second = 60 * 60 * 8 }, --15h
    ['there-is-no-spoon'] = { until_second = 60 * 60 * 4 }, --4h
  },
  ['group-attack-achievement'] = {
    ['it-stinks-and-they-dont-like-it'] = { amount = 1e2 }, --1
  },
  ['construct-with-robots-achievement'] = {
    ['automated-construction'] = { amount = 1e4, limited_to_one_game = true }, --100, false
  },
  ['deconstruct-with-robots-achievement'] = {
    ['automated-cleanup'] = { amount = 1e4 }, --100
  },
  ['deliver-by-robots-achievement'] = {
    ['you-have-got-a-package'] = { amount = 1e5 }, --1
    ['delivery-service'] = { amount = 1e7}, --1e4
  },
  ['train-path-achievement'] = {
    ['trans-factorio-express'] = { minimum_distance = 142000 }, --1'000 (Route 66 is 142 Km)
  },
  ['player-damaged-achievement'] = {
    ['golem'] = { minimum_damage = 3500 }, --500
  },
  ['produce-achievement'] = {
    ['mass-production-1'] = { item_product = "electronic-circuit", amount =    10000, limited_to_one_game = true }, --10k
    ['mass-production-2'] = { item_product = "electronic-circuit", amount =  1000000, limited_to_one_game = true }, --1M
    ['mass-production-3'] = { item_product = "electronic-circuit", amount = target('ahm:green-circuits'), limited_to_one_game = true }, --20M
  },
  ['produce-per-hour-achievement'] = {
    ['circuit-veteran-1'] = { item_product = "advanced-circuit", amount =  10000 }, -- 1'000
    ['circuit-veteran-2'] = { item_product = "advanced-circuit", amount = 100000 }, --10'000
    ['circuit-veteran-3'] = { item_product = "advanced-circuit", amount = 575000 }, --25'000
    ['computer-age-1'] = { item_product = "processing-unit", amount =   5000 }, --  500
    ['computer-age-2'] = { item_product = "processing-unit", amount =  50000 }, --1'000
    ['computer-age-3'] = { item_product = "processing-unit", amount = 145000 }, --5'000
    ['iron-throne-1'] = { item_product = "iron-plate", amount =  100000 }, -- 20'000
    ['iron-throne-2'] = { item_product = "iron-plate", amount =  500000 }, --200'000
    ['iron-throne-3'] = { item_product = "iron-plate", amount = 1200000 }, --400'000
    
  },
  ['dont-use-entity-in-energy-production-achievement'] = {
    ['solaris'] = { minimum_energy_produced = '10TJ' }, --10GJ
  },
  ['kill-achievement'] = {
    ['steamrolled'] = { amount = 100 }, --10
    ['pyromaniac'] = { amount = 1e5 }, --1e4
    ['run-forrest-run'] = { amount = 1e3 }, --100
  },
  ['combat-robot-count'] = {
    ['minions'] = { count = 200 }, --100
  },
  ['dont-craft-manually-achievement'] = {
    ['lazy-bastard'] = { amount = 104 }, --111
  },
  ['dont-build-entity-achievement'] = {
    ['raining-bullets'] = { dont_build = {'laser-turret', 'flamethrower-turret'} }, --lasers
  },
}

for category, a_type in pairs(updates) do
  if data.raw[category] then
    for achievement, params in pairs(a_type) do
      local prototype = data.raw[category][achievement]
      if prototype then
        for k, v in pairs(params) do
          prototype[k] = v
        end
      end
    end
  end
end
