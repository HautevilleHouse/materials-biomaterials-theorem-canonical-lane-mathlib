import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ElasticityFracturePackage where
  stressTensor : Type u
  strainTensor : Type v
  elasticModuli : Type w
  fractureToughness : Float
  stressStrainRelation : Prop
  hookesLawValid : Prop
  fractureCriterion : Prop
  stressStrainRelationClosed : stressStrainRelation
  hookesLawValidClosed : hookesLawValid
  fractureCriterionClosed : fractureCriterion

structure ElasticityFractureEvidence (E : ElasticityFracturePackage) where
  toughnessPositive : E.fractureToughness > 0
  constitutiveLaw : E.stressStrainRelation

def ElasticityFractureClosed (E : ElasticityFracturePackage) : Prop :=
  E.stressStrainRelation ∧ E.hookesLawValid ∧ E.fractureCriterion ∧ E.fractureToughness > 0

theorem elasticity_fracture_closed_from_evidence
    (E : ElasticityFracturePackage) (Ev : ElasticityFractureEvidence E) :
    ElasticityFractureClosed E := by
  exact And.intro E.stressStrainRelationClosed (And.intro E.hookesLawValidClosed
    (And.intro E.fractureCriterionClosed Ev.toughnessPositive))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse