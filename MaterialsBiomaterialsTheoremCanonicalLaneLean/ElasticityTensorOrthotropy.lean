import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ElasticityTensorPackage where
  stiffMatrix : Matrix (Fin 6) (Fin 6) Float
  complianceMatrix : Matrix (Fin 6) (Fin 6) Float
  orthotropicSymmetry : Prop
  positiveDefinite : Prop
  youngModuli : List Float
  poissonRatios : List Float
  shearModuli : List Float

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  orthotropicSymmetryClosed : E.orthotropicSymmetry
  positiveDefiniteClosed : E.positiveDefinite

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.orthotropicSymmetry ∧ E.positiveDefinite

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E := by
  exact And.intro Ev.orthotropicSymmetryClosed Ev.positiveDefiniteClosed

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse