import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure SpectralDecompositionPackage (G : GroupActionDynamicsPackage) where
  spectrum : Type u
  decomposition : Prop
  spectralMeasureExists : Prop

structure SpectralDecompositionEvidence {G : GroupActionDynamicsPackage}
    (S : SpectralDecompositionPackage G) where
  decompositionClosed : S.decomposition
  spectralMeasureExistsClosed : S.spectralMeasureExists

def SpectralDecompositionClosed {G : GroupActionDynamicsPackage}
    (S : SpectralDecompositionPackage G) : Prop :=
  S.decomposition ∧ S.spectralMeasureExists

theorem spectral_decomposition_closed_from_evidence
    {G : GroupActionDynamicsPackage} (S : SpectralDecompositionPackage G)
    (E : SpectralDecompositionEvidence S) : SpectralDecompositionClosed S := by
  exact And.intro E.decompositionClosed E.spectralMeasureExistsClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse
