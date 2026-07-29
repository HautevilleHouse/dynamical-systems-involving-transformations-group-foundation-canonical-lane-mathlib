import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure GroupActionDynamicsPackage where
  group : Type u
  space : Type v
  action : group → space → space
  continuity : Prop
  groupTopology : TopologicalSpace group
  spaceTopology : TopologicalSpace space
  continuousAction : Prop

structure GroupActionDynamicsEvidence (G : GroupActionDynamicsPackage) where
  continuityClosed : G.continuity
  continuousActionClosed : G.continuousAction

def GroupActionDynamicsClosed (G : GroupActionDynamicsPackage) : Prop :=
  G.continuity ∧ G.continuousAction

theorem group_action_dynamics_closed_from_evidence (G : GroupActionDynamicsPackage)
    (E : GroupActionDynamicsEvidence G) : GroupActionDynamicsClosed G := by
  exact And.intro E.continuityClosed E.continuousActionClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse
