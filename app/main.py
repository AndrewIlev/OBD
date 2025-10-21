from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from . import models, schemas, crud
from .database import engine, Base, get_db

Base.metadata.create_all(bind=engine)

app = FastAPI(title="GameDB API")

@app.get("/")
def root():
    return {"message": "API працює!"}

# ===== Guild =====
@app.get("/guilds", response_model=list[schemas.Guild])
def read_guilds(db: Session = Depends(get_db)):
    return crud.get_guilds(db)

@app.post("/guilds", response_model=schemas.Guild)
def create_guild(guild: schemas.GuildCreate, db: Session = Depends(get_db)):
    return crud.create_guild(db, guild)

# ===== Player =====
@app.get("/players", response_model=list[schemas.Player])
def read_players(db: Session = Depends(get_db)):
    return crud.get_players(db)

@app.post("/players", response_model=schemas.Player)
def create_player(player: schemas.PlayerCreate, db: Session = Depends(get_db)):
    return crud.create_player(db, player)

# ===== Quest =====
@app.get("/quests", response_model=list[schemas.Quest])
def read_quests(db: Session = Depends(get_db)):
    return crud.get_quests(db)

@app.post("/quests", response_model=schemas.Quest)
def create_quest(quest: schemas.QuestCreate, db: Session = Depends(get_db)):
    return crud.create_quest(db, quest)

# ===== Item =====
@app.get("/items", response_model=list[schemas.Item])
def read_items(db: Session = Depends(get_db)):
    return crud.get_items(db)

@app.post("/items", response_model=schemas.Item)
def create_item(item: schemas.ItemCreate, db: Session = Depends(get_db)):
    return crud.create_item(db, item)

# ===== Skill =====
@app.get("/skills", response_model=list[schemas.Skill])
def read_skills(db: Session = Depends(get_db)):
    return crud.get_skills(db)

@app.post("/skills", response_model=schemas.Skill)
def create_skill(skill: schemas.SkillCreate, db: Session = Depends(get_db)):
    return crud.create_skill(db, skill)

# ===== Achievement =====
@app.get("/achievements", response_model=list[schemas.Achievement])
def read_achievements(db: Session = Depends(get_db)):
    return crud.get_achievements(db)

@app.post("/achievements", response_model=schemas.Achievement)
def create_achievement(achievement: schemas.AchievementCreate, db: Session = Depends(get_db)):
    return crud.create_achievement(db, achievement)

# ===== MathGame =====
@app.get("/mathgames", response_model=list[schemas.MathGame])
def read_mathgames(db: Session = Depends(get_db)):
    return crud.get_mathgames(db)

@app.post("/mathgames", response_model=schemas.MathGame)
def create_mathgame(mathgame: schemas.MathGameCreate, db: Session = Depends(get_db)):
    return crud.create_mathgame(db, mathgame)
