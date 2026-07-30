import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ElasticityTensorPackage where
  stiffnessTensor : Type u
  complianceTensor : Type v
  symmetryReduction : Type w
  bornStabilityCondition : Prop
  cauchyRelations : Prop
  bornStabilityConditionTerm : bornStabilityCondition
  cauchyRelationsTerm : cauchyRelations

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  bornStabilityConditionClosed : E.bornStabilityCondition
  cauchyRelationsClosed : E.cauchyRelations

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.bornStabilityCondition ∧ E.cauchyRelations

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) :
    ElasticityTensorClosed E := by
  exact And.intro Ev.bornStabilityConditionClosed Ev.cauchyRelationsClosed

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse