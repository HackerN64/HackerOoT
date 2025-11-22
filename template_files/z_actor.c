/*
 * File: {actorFileName}.c
 * Overlay: ovl_{actorSpec}
 * Description: Custom Actor
 */

#include "{actorFileName}.h"

#define FLAGS (0)

void {actorSpec}_Init(Actor* thisx, PlayState* play);
void {actorSpec}_Destroy(Actor* thisx, PlayState* play);
void {actorSpec}_Update(Actor* thisx, PlayState* play);
void {actorSpec}_Draw(Actor* thisx, PlayState* play);

void {actorSpec}_DoNothing({actorSpec}* this, PlayState* play);

{actorVar} {actorSpec}_{actorInitVar} = {
    {actorDefine},
    ACTORCAT_PROP,
    FLAGS,
    {objectDefine},
    sizeof({actorSpec}),
    (ActorFunc){actorSpec}_Init,
    (ActorFunc){actorSpec}_Destroy,
    (ActorFunc){actorSpec}_Update,
    (ActorFunc){actorSpec}_Draw,
};

void {actorSpec}_Init(Actor* thisx, PlayState* play) {
    {actorSpec}* this = ({actorSpec}*)thisx;

    this->actionFunc = {actorSpec}_DoNothing;
}

void {actorSpec}_Destroy(Actor* thisx, PlayState* play) {
    {actorSpec}* this = ({actorSpec}*)thisx;
}

void {actorSpec}_Update(Actor* thisx, PlayState* play) {
    {actorSpec}* this = ({actorSpec}*)thisx;

    this->actionFunc(this, play);
}

void {actorSpec}_Draw(Actor* thisx, PlayState* play) {
    {actorSpec}* this = ({actorSpec}*)thisx;
}

void {actorSpec}_DoNothing({actorSpec}* this, PlayState* play) {

}
