import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure GroupsAction where
  group : Type u
  mult : group → group → group
  id : group
  inv : group → group
  multAssoc : ∀ a b c : group, mult (mult a b) c = mult a (mult b c)
  idLeft : ∀ a : group, mult id a = a
  idRight : ∀ a : group, mult a id = a
  invLeft : ∀ a : group, mult (inv a) a = id
  invRight : ∀ a : group, mult a (inv a) = id

structure GroupAction (X : Type v) (G : GroupsAction) where
  act : G.group → X → X
  actId : ∀ x : X, act G.id x = x
  actMult : ∀ (g h : G.group) (x : X), act (G.mult g h) x = act g (act h x)

structure AdmissibleClass where
  object : GroupAction
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse