class GraphQlPolicy
  GUEST = ->(_obj, _args, ctx) { ctx[:current_user].blank? }
  AUTHENTICATED = ->(_obj, _args, ctx) { ctx[:current_user].present? }
  USER_OR_GUEST = ->(_obj, _args, ctx) { (ctx[:current_user] || ctx[:guest]).present? }
  PUBLIC = ->(_obj, _args, _ctx) { true }
end
