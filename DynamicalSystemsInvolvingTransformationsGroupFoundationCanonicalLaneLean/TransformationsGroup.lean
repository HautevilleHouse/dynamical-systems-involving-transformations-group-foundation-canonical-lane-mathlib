import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.InvariantMeasures

/-!
# Transformations Group Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure TransformationsGroupPackage {G : DynamicalSpace} {M : InvariantMeasuresPackage G} where
  groupOperation : Prop
  identityElement : Prop
  inverseElement : Prop
  closureUnderComposition : Prop
  continuityOfAction : Prop

structure TransformationsGroupEvidence {G : DynamicalSpace} {M : InvariantMeasuresPackage G} (T : TransformationsGroupPackage G M) where
  groupOperationClosed : T.groupOperation
  identityElementClosed : T.identityElement
  inverseElementClosed : T.inverseElement
  closureUnderCompositionClosed : T.closureUnderComposition
  continuityOfActionClosed : T.continuityOfAction

def TransformationsGroupClosed {G : DynamicalSpace} {M : InvariantMeasuresPackage G} (T : TransformationsGroupPackage G M) : Prop :=
  T.groupOperation ∧ T.identityElement ∧ T.inverseElement ∧ T.closureUnderComposition ∧ T.continuityOfAction

theorem transformations_group_closed_from_evidence {G : DynamicalSpace} {M : InvariantMeasuresPackage G} (T : TransformationsGroupPackage G M) (E : TransformationsGroupEvidence T) : TransformationsGroupClosed T := by
  exact And.intro E.groupOperationClosed (And.intro E.identityElementClosed (And.intro E.inverseElementClosed (And.intro E.closureUnderCompositionClosed E.continuityOfActionClosed)))

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse