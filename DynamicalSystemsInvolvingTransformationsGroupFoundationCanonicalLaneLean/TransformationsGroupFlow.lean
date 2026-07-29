import canonicalLaneMathlib.AdmissibleClass

/-!
# Transformations Group Flow Package

This module defines the foundational structure for a dynamical system driven by
a group of transformations on a topological space. A flow is represented as a
group action that encodes the time evolution.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure TransformationsGroupFlow (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] where
  action : G → X → X
  continuousAction : Continuous (Function.uncurry action)
  identityAction : ∀ x : X, action 1 x = x
  compositionAction : ∀ (g h : G) (x : X), action (g * h) x = action g (action h x)

structure TransformationsGroupFlowEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    (F : TransformationsGroupFlow G X) where
  continuousActionClosed : F.continuousAction
  identityActionClosed : F.identityAction
  compositionActionClosed : F.compositionAction

def TransformationsGroupFlowClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    (F : TransformationsGroupFlow G X) : Prop :=
  F.continuousAction ∧ F.identityAction ∧ F.compositionAction

theorem transformations_group_flow_closed_from_evidence
    {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    (F : TransformationsGroupFlow G X) (E : TransformationsGroupFlowEvidence F) :
    TransformationsGroupFlowClosed F := by
  exact And.intro E.continuousActionClosed (And.intro E.identityActionClosed E.compositionActionClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse