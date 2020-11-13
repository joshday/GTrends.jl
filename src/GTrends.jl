module GTrends

using RCall: rimport, rcopy

export gtrends

gtrendsR = Ref{Module}()

function __init__() 
    gtrendsR[] = rimport("gtrendsR")
end

#-----------------------------------------------------------------------------# Query
const UVS = Union{String, Vector{String}}

"""
    gtrends(q; kw...)

# Keyword Args 

- `geo = "US"`: Geographic region, e.g. `"US"`, `["US", "CA"]`.
- `time="all"`: Date range - `now 1-H`, `now 4-H`, `now 1-d`, `today 1-m`, `today 3-m`, `today 12-m`, `today+5-y`, `all`, `Y-m-d Y-m-d`
- `gprop = "web"`: `web`, `news`, `images`, `froogle`, `youtube`.
- `category = 0`: I'm unsure of what categories are here.
- `hl = "en-US"`: ISO language code.
- `low_search_volume=false`: Should include regions with low search volumes .
- `tz = ""`:  See gtrendsR documentation.
- `onlyInterest=false`: If you only want the main interest-over-time data.
"""
function gtrends(q::UVS; geo::UVS = "US", time::String = "all", gprop::UVS = "web", category::Int=0,
                 hl::String = "en-US", low_search_volume::Bool=false, tz="", onlyInterest=false)
    rcopy(gtrendsR[].gtrends(q; geo, time, gprop, category, hl, low_search_volume, onlyInterest))
end


end
