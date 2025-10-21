from datetime import date
from pydantic import BaseModel

# ===== Guild =====
class GuildBase(BaseModel):
    name: str
    rating: int = 0

class GuildCreate(GuildBase):
    pass

class Guild(GuildBase):
    guild_id: int
    created_at: date
    class Config:
        from_attributes = True

# ===== Player =====
class PlayerBase(BaseModel):
    login: str
    nickname: str | None = None
    email: str | None = None
    level: int = 1
    xp: int = 0
    guild_id: int | None = None

class PlayerCreate(PlayerBase):
    pass

class Player(PlayerBase):
    player_id: int
    class Config:
        from_attributes = True

# ===== Quest =====
class QuestBase(BaseModel):
    title: str
    description: str | None = None
    reward: str | None = None
    difficulty: str | None = None

class QuestCreate(QuestBase):
    pass

class Quest(QuestBase):
    quest_id: int
    class Config:
        from_attributes = True

# ===== Item =====
class ItemBase(BaseModel):
    name: str
    item_type: str | None = None
    rarity: str | None = None
    price: int = 0

class ItemCreate(ItemBase):
    pass

class Item(ItemBase):
    item_id: int
    class Config:
        from_attributes = True

# ===== Skill =====
class SkillBase(BaseModel):
    name: str
    level: int = 1
    effect: str | None = None

class SkillCreate(SkillBase):
    pass

class Skill(SkillBase):
    skill_id: int
    class Config:
        from_attributes = True

# ===== Achievement =====
class AchievementBase(BaseModel):
    name: str
    description: str | None = None
    condition_text: str | None = None

class AchievementCreate(AchievementBase):
    pass

class Achievement(AchievementBase):
    achievement_id: int
    class Config:
        from_attributes = True

# ===== MathGame =====
class MathGameBase(BaseModel):
    match_date: date | None = None
    match_type: str | None = None
    result: str | None = None

class MathGameCreate(MathGameBase):
    pass

class MathGame(MathGameBase):
    match_id: int
    class Config:
        from_attributes = True
