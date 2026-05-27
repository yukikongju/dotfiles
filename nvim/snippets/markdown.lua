local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {

    s({ trig = "table", dscr = "Markdown table (3 columns)" }, fmt(
        "| {c1} | {c2} | {c3} |\n|------|------|------|\n| {r1} | {r2} | {r3} |\n| {r4} | {r5} | {r6} |\n{cursor}",
        {
            c1 = i(1, "Col 1"),
            c2 = i(2, "Col 2"),
            c3 = i(3, "Col 3"),
            r1 = i(4, ""),
            r2 = i(5, ""),
            r3 = i(6, ""),
            r4 = i(7, ""),
            r5 = i(8, ""),
            r6 = i(9, ""),
            cursor = i(0),
        }
    )),


    -- =========================================================
    -- Templates
    -- =========================================================

    s({ trig = "tadhoc", dscr = "Work Adhoc Template" }, fmt([[
# {title}

- **Date:** {date}
- **Expected Time:** {expected_time}
- **Time:**

## Claim

## Context

[JIRA]

## ACs

## Impact Analysis

## Fix Options

| Option        | Effort | Description | Pros | Cons |
|---------------|--------|-------------|------|------|
| **Quick Fix** | Low    |             |      |      |
| **Better**    | Medium |             |      |      |
| **Best**      | High   |             |      |      |

## Deliverables

## Reference Docs

**Files**

**Docs**

**Notebooks**
{cursor}]], {
        title = i(1, ""),
        date = i(2, ""),
        expected_time = i(3, ""),
        cursor = i(0),
    })),

    s({ trig = "tmeeting", dscr = "Work Meeting Template" }, fmt([[
# {title}

**Date:** {date}
**Attendees:** {attendees}
**Topics:** {topics}
**Time:**

## Topic 1 -

## Meeting Flow

### Recommended Agenda

### Deliverables


## Reference Docs
{cursor}]], {
        title = i(1, "Meeting Prep"),
        date = i(2, "today"),
        attendees = i(3, ""),
        topics = i(4, ""),
        cursor = i(0),
    })),

    s({ trig = "tpaper", dscr = "Template Paper Review" }, fmt([[
# {title}

**Overview**

**Method**

**Contributions**

**Strengths**

**Weaknesses**

**Reflections**

**Most interesting thoughts**
{cursor}]], {
        title = i(1, "Paper Review"),
        cursor = i(0),
    })),

    s({ trig = "tpostmortem", dscr = "Template Post Mortem" }, fmt([[
# {title}

**Date:** {date}
**Teams:**
**Incident:**
**Severity:**
**Time to detect:**
**Time to respond:**
**Time to resolve:**

## What happened

## Root Cause

## Resolution

## Timeline

## Impact

## Next Steps


## Reference Docs

- [How to write a Postmortem](https://www.pagerduty.com/resources/insights/learn/how-to-write-postmortem/)
{cursor}]], {
        title = i(1, "Postmortem - "),
        date = i(2, ""),
        cursor = i(0),
    })),

    s({ trig = "tproject", dscr = "Template Project Scoping" }, fmt([[
# Project Scoping - {title}

- **Date:** {date}
- **Expected Time:** {expected_time}
- **Time:**

## Objective

## Decisions need to be made

## Requirements

**Data**

**Modeling**

## Deliverables

## Implementation Scope

## Reference Docs

**Files**

{cursor}]], {
        title = i(1, ""),
        date = i(2, ""),
        expected_time = i(3, ""),
        cursor = i(0),
    })),

    s({ trig = "tlearning", dscr = "Template Learning" }, fmt([[
# Learning - {title}

**Date**: {date}
**Topics**: {topics}
**Estimated Time**:
**Time**:

## Objectives


## Reference Docs

**Files**

**Guide**

**Docs**
{cursor}]], {
        title = i(1, ""),
        date = i(2, ""),
        topics = i(3, ""),
        cursor = i(0),
    })),

    s({ trig = "tdiary", dscr = "VimWiki Diary Template" }, { i(0) }),

    s({ trig = "tconcept", dscr = "Concept Template" }, fmt([[
## Overview

{overview}

## Reference Docs

{refs}
{cursor}]], {
        overview = i(1, ""),
        refs = i(2, ""),
        cursor = i(0),
    })),

    s({ trig = "tdtracking", dscr = "Daily Tracking Template" }, fmt([[
==== AM ====

{am}

==== PM ====
{cursor}]], {
        am = i(1, ""),
        cursor = i(0),
    })),

    s({ trig = "template-weekly-review", dscr = "Weekly Review" }, fmt([[
# Weekly Review: {week}

## Goals

{goals}

**Projects & Learning**

{projects}

**Career**

{career}

**Relationships**

{relationships}

**Frisbee**

{frisbee}

**Growing Up**

{growing_up}


**Self-Help**

{self_help}

## Miscellaneous

**Readings**

{readings}

**Entertainment**

{entertainment}

## Recap

**Feelings**

{feelings}

**Improvements Made**

{improvements}

**To Improve**

{to_improve}

**Thoughts**

{thoughts}


**Looking Forward to**

{looking_forward}

**Focus for next week**

{focus}
{cursor}]], {
        week            = i(1, "Jan 2024 - Week 3"),
        goals           = i(2, ""),
        projects        = i(3, ""),
        career          = i(4, ""),
        relationships   = i(5, ""),
        frisbee         = i(6, ""),
        growing_up      = i(7, ""),
        self_help       = i(8, ""),
        readings        = i(9, ""),
        entertainment   = i(10, ""),
        feelings        = i(11, ""),
        improvements    = i(12, ""),
        to_improve      = i(13, ""),
        thoughts        = i(14, ""),
        looking_forward = i(15, ""),
        focus           = i(16, ""),
        cursor          = i(0),
    })),

    s({ trig = "htbsnip", dscr = "Hack The Box snippet" }, fmt([[
# {name}

[Walkthrough]

Goal:

## Concepts Learned

**Commands**

**Recap**
{cursor}]], {
        name = i(1, "name"),
        cursor = i(0),
    })),


}
